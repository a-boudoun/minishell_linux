/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_paths.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aboudoun <aboudoun@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/06/12 14:15:51 by yaskour           #+#    #+#             */
/*   Updated: 2022/07/04 12:47:59 by aboudoun         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/minishell.h"

void add_at_end(t_env *my_env,char *name,char *value)
{
	t_env *tmp;
	
	tmp = malloc(sizeof(t_env));
	tmp->name = name;
	tmp->value = value;
	tmp->next= NULL;
	while(my_env->next)
		my_env = my_env->next;
	my_env->next = tmp;

}

t_env *get_env(char **env)
{
	if (!**env)
		return (0);
	t_env *my_env;
	char **splited;

	int i  = 0;

	splited = ft_split(env[i],'=');
	my_env = malloc(sizeof(t_env) * 1);
	my_env->name = splited[0];
	my_env->value = splited[1];
	my_env->next = NULL;
	free(splited);
	i++;
	while(env[i])
	{
		splited = ft_split(env[i],'=');
		add_at_end(my_env,splited[0],splited[1]);
		free(splited);
		i++;
	}
	return (my_env);
}
